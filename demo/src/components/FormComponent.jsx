import { useForm } from '@tanstack/react-form';

const FormComponent = () => {
  const form = useForm({
    initialValues: {
      name: '',
      age: '',
    },
    onSubmit: (values) => {
      console.log(values);
    },
  });

  return (
    <form onSubmit={form.handleSubmit}>
      <form.Field
        name="name"
        children={(field) => (
          <input
            name={field.name}
            value={field.state.value}
            onBlur={field.handleBlur}
            onChange={(e) => field.handleChange(e.target.value)}
            placeholder="Name"
          />
        )}
      />
      <form.Field
        name="age"
        children={(field) => (
          <input
            name={field.name}
            value={field.state.value}
            onBlur={field.handleBlur}
            onChange={(e) => field.handleChange(e.target.value)}
            placeholder="Age"
            type="number"
          />
        )}
      />
      <button type="submit">Submit</button>
    </form>
  );
};

export default FormComponent;